function slide!(cur_piece::AbstractPiece, cur_grid::AbstractGrid, cur_direction::Integer)
  cur_blocks = map(
    cur_block -> calc_block_coords(cur_block),
    cur_piece.blocks
  )

  did_move = false

  new_direction = 0

  for tmp_direction in sign(cur_direction):sign(cur_direction):cur_direction

    for (cur_index, cur_block) in enumerate(cur_blocks)
      cur_blocks[cur_index] = (
        first(cur_block) + 0,
        last(cur_block) + sign(cur_direction)
      )
    end

    check(cur_blocks, cur_grid) || break

    did_move = true

    new_direction = tmp_direction

  end

  did_move || return false

  toggle_piece(cur_piece, false)

  cur_piece.j += new_direction

  toggle_piece(cur_piece, true)

  true
end
