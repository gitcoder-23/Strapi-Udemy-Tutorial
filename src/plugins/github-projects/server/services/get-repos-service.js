"use strict";

const { request } = require("@octokit/request");
const axios = require("axios");

module.exports = ({ strapi }) => ({
  getPublicRepos: async () => {
    // return "Welcome to Strapi 🚀";
    const result = await request("GET /user/repos", {
      headers: {
        authorization: `token ${process.env.GITHUB_TOKEN}`,
      },
      // org: "octokit",
      type: "public",
      // type: "private",
    });
    return Promise.all(
      result?.data?.map(async (item) => {
        const { id, name, description, html_url, owner, default_branch } = item;

        const readmeUrl = `https://row.githubusercontent.com/${owner.login}/${name}/${default_branch}/README.md`;
        // return console.log("readmeUrl-.", readmeUrl);
        const longDescription = await axios.get(readmeUrl).data;
        // return console.log("longDescription->", longDescription);
        return {
          id,
          name,
          shortDescription: description,
          url: html_url,
          longDescription,
        };
      })
    );
    // return result;
  },
});
