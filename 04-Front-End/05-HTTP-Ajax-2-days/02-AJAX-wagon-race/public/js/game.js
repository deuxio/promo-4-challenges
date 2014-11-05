$(function() {
  var session_id = null;
  var players = [null, null];
  // var session_created_at = null;
  var session_updated_at = null;
  var session_ended_at = null;
  var game_id = null;
  var game_time = null;
  var winner = null;

  startup()

  // FUNCTIONS
    // STARTING UP THE GAME
    function startup() {
      $('#wrapper').hide();
      $('#player-names').hide();
      $('#winner').hide();
      $('#countdown').hide();
      create_session();
    }

    // CREATE NEW SESSION
    function create_session() {
      $.get( "http://localhost:4567/session/create", function( data ) {
        session_id = data.id;
        // session_created_at = Date.parse(data.created_at);
        $('#start-game').show();
      });
    }

    // CLICK START GAME BUTTON
    $('#start-game').click(function() {
      $('#start-game').hide();
      $('#player-names').show();
      $('#playername1').focus();
    });

    // GET PLAYERS' NAME FROM INPUTS
    $('#player-names').submit(function(event) {
      event.preventDefault();
      players[0] = $('#playername1').val();
      players[1] = $('#playername2').val();
      create_players(players[0], players[1]);
    });

    // CREATE NEW GAME WITH PLAYERS NAME
    function create_players(player1, player2) {
      $.post( "http://localhost:4567/session/" + session_id + "/game/create",
        JSON.stringify({ "players": [ { "name": player1 }, { "name": player2 } ] }),
        function( data ) {
          game_id = data.game.id;
          $('#player-names').hide();
        }
      );
      countdown();
    }

    // COUNTDOWN
    function countdown() {
      $('#countdown').show();
      setTimeout(function() { $('#countdown span').text('2')}, 1000);
      setTimeout(function() { $('#countdown span').text('1')}, 2000);
      setTimeout(function() { $('#countdown span').text('0')}, 2900);
      setTimeout(function() {
        $('#countdown').hide();
        $('#wrapper').show();
        play();
        session_updated_at = $.now();
        }, 3000);
      }

    // PLAY GAME
    function play() {
      $(document).on('keyup', function(e) {
        if(e.keyCode == '80') {
          $("#player1").animate({
            left: '+=5%'
          }, 50);
        };
        if(e.keyCode == '81') {
          $("#player2").animate({
            left: '+=5%'
          }, 50);
        };
        if ( $('#player1').position().left > $('#finish-line').position().left ) { end_game(1); };
        if ( $('#player2').position().left > $('#finish-line').position().left ) { end_game(2); };
      });
    };

    // END GAME
    function end_game(winner) {
      $(document).off('keyup');
      session_ended_at = $.now();
      game_time = Math.round((session_ended_at - session_updated_at)/1000);

      $.post( "/game/" + game_id + "/finish",
      JSON.stringify( { "winner": winner, "elapsed_time": game_time } ),
      function( data ) {
        console.log(data);
        $('#winner h2 .who').text(players[ winner - 1 ]);
        $('#winner').show();
        }
      );
    }

});