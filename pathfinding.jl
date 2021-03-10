module Kata
export pathfinder

function pathfinder(maze)
    maze = split(maze, "\n")
    stack = [(1, 1)]
    visited, N = Set(), length(maze)
    println(N)
    while length(stack) > 0
        y, x = pop!(stack)
        if y == N && x == N
            return true
        end
        for (i, j) in [(y, x + 1), (y, x - 1), (y - 1, x), (y + 1, x)]
            if 0 < i < N + 1 && 0 < j < N + 1 && maze[i][j] != 'W' && !in((i, j), visited)
                push!(stack, (i, j))
            end
        end
        push!(visited, (y, x))
    end
    false
end

end # module
