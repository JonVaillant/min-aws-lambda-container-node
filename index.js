"use strict";

exports.handler = async (event, context) => {
    return {
        statusCode: 200,
        body: { message: event?.payload || 'Hello world' }
    };
}
