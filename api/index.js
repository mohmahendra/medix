const Koa = require('koa');
const Router = require('koa-router');
const MongoClient = require('mongodb').MongoClient;

const app = new Koa();
const router = new Router({prefix: '/api'});

MongoClient.connect('mongodb://medix:gghamilton666@ds129706.mlab.com:29706/medix', function(err, client) {
  const db = client.db('medix');

  router.get('/categories', async (ctx, next) => {
    const result = await db.collection('services').find().toArray();
    console.log(result);
    ctx.body = {
      data: result
    }
  })

  router.get('/category/:categoryId', async (ctx, next) => {
    const result = await db.collection('services').findOne({categoryId: parseInt(ctx.params.categoryId)});
    ctx.body = {
      data: result
    }
  });
   
  app
    .use(router.routes())
    .use(router.allowedMethods());

    app.listen(8000, () => {
      console.log('App listening on port 8000');
    })
});


