module.exports = ({ env }) => ({
  auth: {
    secret: env("ADMIN_JWT_SECRET", "u0AeBeTS6F"),
  },
  apiToken: {
    salt: env("API_TOKEN_SALT", "Cb4HgzsBAr"),
  },
  // url: "/dashboard",
  url: env("PUBLIC_ADMIN_URL", "/dashboard"),
});
