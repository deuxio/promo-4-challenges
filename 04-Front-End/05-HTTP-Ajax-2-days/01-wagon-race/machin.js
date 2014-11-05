$(function() {
        // when clicking on player's key (p for player1 // q for player 2)
        // add +5% to the div's margin-left
        $('#winner').hide();

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
          // when player reach 80% of the screen width
          // show the winner card
          if ( $('#player1').position().left > $('#finish-line').position().left ) {
            $('#winner .who').text('Player 1');
            $('#winner').show();
          };
          if ( $('#player2').position().left > $('#finish-line').position().left ) {
            $('#winner .who').text('Player 2');
            $('#winner').show();
          };
        });
        // restart game

      });