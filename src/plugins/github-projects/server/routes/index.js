// module.exports = [
//   {
//     method: "GET",
//     path: "/gitrepos", // localhost:1337/github-projects/gitrepos
//     handler: "myController.index",
//     config: {
//       policies: [],
//     },
//   },
// ];

module.exports = [
  {
    method: "GET",
    path: "/gitrepos", // localhost:1337/github-projects/gitrepos
    handler: "getReposController.index",
    config: {
      policies: [],
      auth: false, // TODO: Change this to authorized only for admin panel users
    },
  },
];
