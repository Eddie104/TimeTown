module.exports = (app) => {
    return new Handler(app);
};

class Handler {
    constructor(app) {
        this.app = app;
    }
    test(msg, session, next) {
        next(null, {
            code: 200,
            msg: 'this is test!'
        });
    }
    /**
	 * New client entry.
	 *
	 * @param  {Object}   msg     request message
	 * @param  {Object}   session current session object
	 * @param  {Function} next    next step callback
	 * @return {Void}
	 */
    entry(msg, session, next) {
        next(null, { code: 200, msg: 'game server is ok.' });
    }
    /**
	 * Publish route for mqtt connector.
	 *
	 * @param  {Object}   msg     request message
	 * @param  {Object}   session current session object
	 * @param  {Function} next    next step callback
	 * @return {Void}
	 */
    publish(msg, session, next) {
        var result = {
            topic: 'publish',
            payload: JSON.stringify({ code: 200, msg: 'publish message is ok.' })
        };
        next(null, result);
    }
    /**
	 * Subscribe route for mqtt connector.
	 *
	 * @param  {Object}   msg     request message
	 * @param  {Object}   session current session object
	 * @param  {Function} next    next step callback
	 * @return {Void}
	 */
    subscribe(msg, session, next) {
        var result = {
            topic: 'subscribe',
            payload: JSON.stringify({ code: 200, msg: 'subscribe message is ok.' })
        };
        next(null, result);
    }
}
