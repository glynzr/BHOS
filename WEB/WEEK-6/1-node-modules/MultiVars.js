let user = {
    username: 'Ilkay',
    email: 'ilkay@msn.com',
    nickname: 'dragon'
};

let userMessage = function(param){
    console.log(`${param} is the best system!`);
}

module.exports.user = user;
module.exports.userMessage = userMessage;