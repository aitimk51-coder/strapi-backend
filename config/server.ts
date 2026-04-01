import type { Core } from '@strapi/strapi';

const config = ({ env }: { env: Core.Env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 8080),
  app: {
    keys: env.array('APP_KEYS'),
  },
  url: env('PUBLIC_URL', ''),
  proxy: true,
});

export default config;
