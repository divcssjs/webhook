var http = require('http')
var spawn = require('child_process').spawn
const exec = require('child_process').execSync

var createHandler = require('github-webhook-handler')
var handler = createHandler({ path: '/', secret: 'webhook' })
// var createHandler = require('gitee-webhook-middleware') // gitee
// var handler = createHandler({ path: '/', token: 'webhook' }) // gitee
http
  .createServer(function (req, res) {
    handler(req, res, function (err) {
      res.statusCode = 200
      res.end('ok')
    })
  })
  .listen(5000)
console.log('listen at prot 5000')

handler.on('error', function (err) {
  console.error('Error:', err.message)
})

// 修改push监听事件,用来启动脚本文件
// Push Hook => gitee | push => github
handler.on('push', function (event) {
  console.log(
    'Received a push event for %s to %s',
    event.payload.repository.name,
    event.payload.ref
  )

  runCommand('sh', [`./load-api.sh`], function (txt) {
    console.log(txt)
  })
})

function runCommand(cmd, args, callback) {
  var child = spawn(cmd, args)
  var resp = 'Deploy OK'
  child.stdout.on('data', function (buffer) {
    resp += buffer.toString()
  })
  child.stdout.on('end', function () {
    callback(resp)
  })
}
