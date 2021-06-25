

while($true)
{
mongo --host 127.0.0.1 --port 62660 -u admin -p password store --eval "db.products.insert( {item: 'box', qty: 20, asdf: 'asdfasdfsdfasdfasdf', qty1: 2343422423 , qty2: 2343422423 , qty3: 2343422423 , qty4: 2343422423 , qty5: 2343422423 , qty6: 2343422423})"
mongo --host 127.0.0.1 --port 62660 -u admin -p password admin --eval "db.products.insert( {item: 'box', qty: 20, asdf: 'asdfasdfsdfasdfasdf', qty1: 2343422423 , qty2: 2343422423 , qty3: 2343422423 , qty4: 2343422423 , qty5: 2343422423 , qty6: 2343422423})"
mongo --host 127.0.0.1 --port 62660 -u admin -p password store --eval "db.products.insert( {item: 'box', qty: 20, asdf: 'asdfasdfsdfasdfasdf', qty1: 2343422423 , qty2: 2343422423 , qty3: 2343422423 , qty4: 2343422423 , qty5: 2343422423 , qty6: 2343422423})"
mongo --host 127.0.0.1 --port 62660 -u admin -p password admin --eval "db.products.insert( {item: 'box', qty: 20, asdf: 'asdfasdfsdfasdfasdf', qty1: 2343422423 , qty2: 2343422423 , qty3: 2343422423 , qty4: 2343422423 , qty5: 2343422423 , qty6: 2343422423})"
mongo --host 127.0.0.1 --port 62660 -u admin -p password store --eval "db.products.insert( {item: 'box', qty: 20, asdf: 'asdfasdfsdfasdfasdf', qty1: 2343422423 , qty2: 2343422423 , qty3: 2343422423 , qty4: 2343422423 , qty5: 2343422423 , qty6: 2343422423})"
$rnd = Get-Random -Minimum 1 -Maximum 3
Start-Sleep -Seconds $rnd
mongo --host 127.0.0.1 --port 62660 -u admin -p password store --eval "coll = db.store.find({ name: 'Joe' })"
mongo --host 127.0.0.1 --port 62660 -u admin -p password admin --eval "coll = db.store.find({ name: 'Joe' })"
mongo --host 127.0.0.1 --port 62660 -u admin -p password admin --eval "coll = db.store.find({ name: 'Joe' })"
}