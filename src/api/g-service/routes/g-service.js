'use strict';

/**
 * g-service router
 */

const { createCoreRouter } = require('@strapi/strapi').factories;

module.exports = createCoreRouter('api::g-service.g-service');
