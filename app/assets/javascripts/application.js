// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function isWhiteTurn(){
	current_player = $('#current_player').val();
	if(current_player == 'white'){
		return true;
	}else{
		return false;
	}
}

function isBlackTurn(){
	current_player = $('#current_player').val();
	if(current_player == 'black'){
		return true;
	}else{
		return false;
	}
}

function exchangePlayer(){
	if(isWhiteTurn()){
		$('#current_player').val('black');
	}else{
		$('#current_player').val('white');
	}
}

function pickUpWhite(){
	chess_piece = $('#white_piece').clone();
	return chess_piece
}

function pickUpBlack(){
	chess_piece = $('#black_piece').clone();
	return chess_piece
}

function putOnChessboard(chess_piece, x, y){
	coordinates = adjust(x, y);
	xa = coordinates[0]
	ya = coordinates[1]
	$('#chessboard_container').append(chess_piece);
	$(chess_piece).attr('id', 'move');
  $(chess_piece).css(
    {
      position: 'absolute',
      left: (xa-14) + 'px',
      top: (ya-14) + 'px',
      display: 'block'
    }
  );
  exchangePlayer();
}

function adjust(x, y){
	INTERVAL = 33.3
	X_OFFSET = 115
	X_MAX = 115+INTERVAL*18
	Y_OFFSET = 34
	Y_MAX = 34+INTERVAL*18
	x_minus = Math.floor((x-115)/INTERVAL)*INTERVAL+115
	x_plus = x_minus + INTERVAL
	y_minus = Math.floor((y-34)/INTERVAL)*INTERVAL+34
	y_plus = y_minus + INTERVAL
	top_left = [x_minus, y_minus]
	top_right = [x_plus, y_minus]
	bottom_left = [x_minus, y_plus]
	bottom_right = [x_plus, y_plus]

	distance = INTERVAL*INTERVAL + INTERVAL*INTERVAL
	target = []
	// top left
	if(x_minus>=115 && x_minus <= X_MAX && y_minus>=34 && y_minus<=Y_MAX){
		top_left_distance = (x-x_minus)*(x-x_minus) + (y-y_minus)*(y-y_minus)
		if(top_left_distance < distance){
			distance = top_left_distance
			target = top_left
		}
	}

	//top right
	if(x_plus>=115 && x_plus <= X_MAX && y_minus>=34 && y_minus<=Y_MAX){
		top_right_distance = (x-x_plus)*(x-x_plus) + (y-y_minus)*(y-y_minus)
		if(top_right_distance < distance){
			distance = top_right_distance
			target = top_right
		}
	}

	//bottom left
	if(x_minus>=115 && x_minus <= X_MAX && y_plus>=34 && y_plus<=Y_MAX){
		bottom_left_distance = (x-x_minus)*(x-x_minus) + (y-y_plus)*(y-y_plus)
		if(bottom_left_distance < distance){
			distance = bottom_left_distance
			target = bottom_left
		}
	}

	//bottom right
	if(x_plus>=115 && x_plus <= X_MAX && y_plus>=34 && y_plus<=Y_MAX){
		bottom_right_distance = (x-x_plus)*(x-x_plus) + (y-y_plus)*(y-y_plus)
		if(bottom_right_distance < distance){
			distance = bottom_right_distance
			target = bottom_right
		}
	}

	return target
}


