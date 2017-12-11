var pomelo = require('pomelo');

/**
 * Init app for client.
 */
var app = pomelo.createApp();
app.set('name', 'server');

// app configuration
app.configure('production|development', 'connector', () => {
    app.set('connectorConfig',
        {
            connector : pomelo.connectors.hybridconnector,
            heartbeat : 3,
            useDict : true,
            useProtobuf : true
        });
});

console.log('---------------=================');

// start app
app.start();

process.on('uncaughtException', (err) => {
    console.error(' Caught exception: ' + err.stack);
});
