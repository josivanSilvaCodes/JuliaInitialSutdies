ids = zeros(Int, 12)
Threads.@threads for i in 1:12
    ids[i] = Threads.threadid()
end
println("IDs observados: ", ids)
println("IDs diferentes: ", unique(ids))
