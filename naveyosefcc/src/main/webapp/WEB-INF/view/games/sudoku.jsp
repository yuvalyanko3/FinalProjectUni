<%--
  Created by IntelliJ IDEA.
  User: Yuval
  Date: 26/11/2019
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" media="all" type="text/css" href="https://mczak.com/code/sudoku/css/sudoku.css">

    <style>
        * {
            margin:0; padding:0;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }
        .wrap {
            padding: 2em 1em;
            width: 400px;
            max-width: 100%;
            margin-left: auto;
            margin-right: auto;
        }

        @media(min-width: 30em){
            .wrap{
                width: 490px;
            }
            .sudoku-board input {
                font-size: 24px;
                font-size: 1.5rem;
            }
            .sudoku-board .candidates {
                font-size: .8em;
            }
        }
    </style>

    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="/games/sudoku/sudoku.js"></script>
</head>
<body>
<div class="wrap">

    <!--show candidates toggle-->
    <label for="toggleCandidates">Show candidates  </label><input id="toggleCandidates" class="js-candidate-toggle" type="checkbox"/>
    <!--generate board buttons-->
    New:
    <button type="button" class="js-generate-board-btn--easy">Easy</button>
    <button type="button" class="js-generate-board-btn--medium">Medium</button>
    <button type="button" class="js-generate-board-btn--hard">Hard</button>
    <button type="button" class="js-generate-board-btn--very-hard">Very Hard</button>

    <!--the only required html-->
    <div id="sudoku" class="sudoku-board">
    </div>

    <!--solve buttons-->
    Solve: <button type="button" class="js-solve-step-btn">One Step</button><button type="button" class="js-solve-all-btn">All</button>
    <br>
    <!--clear board btn-->
    Clear: <button type="button" class="js-clear-board-btn">Board</button>
</div>

<script>
    var	$candidateToggle = $(".js-candidate-toggle"),
        $generateBoardBtnEasy = $(".js-generate-board-btn--easy"),
        $generateBoardBtnMedium = $(".js-generate-board-btn--medium"),
        $generateBoardBtnHard = $(".js-generate-board-btn--hard"),
        $generateBoardBtnVeryHard = $(".js-generate-board-btn--very-hard"),

        $solveStepBtn = $(".js-solve-step-btn"),
        $solveAllBtn = $(".js-solve-all-btn"),
        $clearBoardBtn = $(".js-clear-board-btn"),

        mySudokuJS = $("#sudoku").sudokuJS({
            difficulty: "very hard"
            //change state of our candidate showing checkbox on change in sudokuJS
            ,candidateShowToggleFn : function(showing){
                $candidateToggle.prop("checked", showing);
            }
        });

    $solveStepBtn.on("click", mySudokuJS.solveStep);
    $solveAllBtn.on("click", mySudokuJS.solveAll);
    $clearBoardBtn.on("click", mySudokuJS.clearBoard);

    $generateBoardBtnEasy.on("click", function(){
        mySudokuJS.generateBoard("easy");
    });
    $generateBoardBtnMedium.on("click", function(){
        mySudokuJS.generateBoard("medium");
    });
    $generateBoardBtnHard.on("click", function(){
        mySudokuJS.generateBoard("hard");
    });
    $generateBoardBtnVeryHard.on("click", function(){
        mySudokuJS.generateBoard("very hard");
    });

    $candidateToggle.on("change", function(){
        if($candidateToggle.is(":checked"))
            mySudokuJS.showCandidates();
        else
            mySudokuJS.hideCandidates();
    });
    $candidateToggle.trigger("change");
</script>
</body>
</html>
