db.getCollectionNames().forEach(function(c) {if(c.indexOf('o_') < 0) return; db[c].remove(({'m.ts': {'$lt': new Date().getTime() - 7 * 24 * 60 * 60 * 1000}}));})
db.tasks.remove(({'createdAt': {'\$lt': new Date().getTime() - 24 * 60 * 60 * 1000}}))
db.o_tasks.remove(({'m.ts': {'\$lt': new Date().getTime() - 24 * 60 * 60 * 1000}}))