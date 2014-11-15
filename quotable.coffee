module.exports = (robot) ->
  robot.respond /quote (.*)/i, (msg) ->
    user = msg.match[1]
    robot.http('http://quotable.meteor.com/api/quotes/' + user)
      .get() (err, res, body) ->
        data = JSON.parse(body)
        msg.send "#{data.quotes[Math.floor(Math.random() * data.quotes.length)]}"
