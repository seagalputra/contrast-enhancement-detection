function block = split_block(img, block_size_row, block_size_column)

[rows, columns, plane] = size(img);

block_rows = floor(rows / block_size_row);
block_vector_rows = [block_size_row * ones(1, block_rows), rem(rows, block_size_row)];
block_columns = floor(columns / block_size_column);
block_vector_columns = [block_size_column * ones(1, block_columns), rem(columns, block_size_column)];

if (plane > 1)
    block = mat2cell(img, block_vector_rows, block_vector_columns, plane);
else
    block = mat2cell(img, block_vector_rows, block_vector_columns);
end

end