import React from "react";
import BoardRow from "./BoardRow";

const Board = ({ board, selectPiece, validMoves }) => {
  return (
    <div className="columns">
      <div className="column board is-12 is-offset-6">
        {board.map((rowPieces, i) => (
          <BoardRow
            key={i}
            pieces={rowPieces}
            row={i}
            selectPiece={selectPiece}
            validMoves={validMoves}
          />
        ))}
      </div>
    </div>
  );
};

export default Board;