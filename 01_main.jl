println("Julia: ", VERSION)
println("PID: ", getpid())
println("CPUs lógicas visíveis: ", Sys.CPU_THREADS)
println("Threads default: ", Threads.nthreads(:default))
println("Threads interactive: ", Threads.nthreads(:interactive))
println("Thread atual: ", Threads.threadid())

