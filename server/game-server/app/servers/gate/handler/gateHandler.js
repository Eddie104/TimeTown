var dispatcher = require('../../../util/dispatcher');

module.exports = function (app) {
    return new Handler(app);
};

class Handler {
    constructor(app) {
        this.app = app;
    }

    /**
     * Gate handler that dispatch user to connectors.
     *
     * @param {Object} msg message from client
     * @param {Object} session
     * @param {Function} next next stemp callback
     *
     */
    queryEntry(msg, session, next) {
        console.log('aaaaaaa');
        
        const uid = msg.uid;
        if (!uid) {
            next(null, {
                code: 500,
                msg: 'no uid'
            });
            return;
        }
        console.log('bbbbbbbb');
        // get all connectors
        const connectors = this.app.getServersByType('connector');
        if (!connectors || connectors.length === 0) {
            next(null, {
                code: 500,
                msg: 'no connector'
            });
            return;
        }
        console.log('cccccccc');
        // select connector
        const res = dispatcher.dispatch(uid, connectors);
        next(null, {
            code: 200,
            host: res.host,
            port: res.clientPort
        });
    }
}
