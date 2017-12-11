// var chatRemote = require('../remote/chatRemote');

module.exports = (app) => {
    return new Handler(app);
};

class Handler {
    constructor(app) {
        this.app = app;
    }

    /**
     * Send messages to users
     *
     * @param {Object} msg message from client
     * @param {Object} session
     * @param  {Function} next next stemp callback
     *
     */
    send(msg, session, next) {
        const rid = session.get('rid');
        const username = session.uid.split('*')[0];
        const channelService = this.app.get('channelService');
        const param = {
            msg: msg.content,
            from: username,
            target: msg.target
        };
        const channel = channelService.getChannel(rid, false);

        //the target is all users
        if (msg.target === '*') {
            channel.pushMessage('onChat', param);
        }
        //the target is specific user
        else {
            const uid = msg.target + '*' + rid;
            const sid = channel.getMember(uid)['sid'];
            channelService.pushMessageByUids('onChat', param, [{
                uid,
                sid
            }]);
        }
        next(null, {
            route: msg.route
        });
    }
}
