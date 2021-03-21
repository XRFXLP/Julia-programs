# BFS implementation of finding shortest path in a unwieghted undirected grid with walls
function pathfinder(maze)
    maze = map(x->split(x,""), split(maze, "\n"))
    visited = Set()
    push!(visited, (1, 1))
    queue = [(1, 1)]
    N = length(maze)
    cost = Dict((1, 1)=>0)
    head = 1
    while head <= length(queue)
        (y, x) = queue[head]
        head += 1
        if (y, x) == (N, N)
            return cost[(y, x)]
        end
        for (y_, x_) in [(y, x + 1), (y, x - 1), (y + 1, x), (y - 1, x)]
            if 0 < y_ <= N && 0 < x_ <= N && maze[y_][x_][1] != 'W' && !in((y_, x_), visited)
                push!(queue, (y_, x_))
                push!(visited, (y_, x_))
                cost[(y_, x_)] = cost[(y, x)] + 1
            end
        end
        push!(visited, (y, x))
    end
    false
end
