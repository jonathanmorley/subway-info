var mongo = require('mongodb');
var db = require('monk')('localhost/subway-info');
var express = require('express');
var app = new express();

var PORT = 3000;

app.use(express.static(__dirname + '/public'));

app.get('/', function(req, res){
  db.get('subways').find()
    .success(function(subways){
      res.json(subways);
    });
});

app.get('/:subwayId', function(req, res){
  db.get('subways').findOne({slug: req.params.subwayId})
    .success(function(subway){
      res.json(subway);
    });
});

//app.get('/:subwayId/lines');
//app.get('/:subwayId/lines/:lineId');

//app.get('/:subwayId/stations');
//app.get('/:subwayId/stations/:stationId');

//app.get('/:subwayId/routes');
//app.get('/:subwayId/routes/:originId');
//app.get('/:subwayId/routes/:originId/:destinationId');

app.listen(PORT)
console.log('Running on http://localhost:' + PORT);
