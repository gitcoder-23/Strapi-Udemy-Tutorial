'use strict';

/**
 * g-service service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::g-service.g-service');
