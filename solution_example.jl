function prime(n)
    if n < 1
        throw(DomainError("Argument passed to prime() must be > 0."))
    end

    lim = convert(Int64, ceil(1.2n*log(n)) + 10)
    primes = primesTo(lim)


    primes[n] # returned
end


function primesTo(n::Integer)
    if n < 2;    return []; end
    res = Int64[2]
    sizehint!(res, convert( Int64, floor( n / log(n) ) ))
    oddsAlive = trues((n-1) ÷ 2) # oddsAlive[i] represents 2i + 1

    i_lim = (convert( Int64, floor(√n) ) - 1) ÷ 2
    for i = 1 : i_lim
        if oddsAlive[i] # It's prime.  Kill odd multiples of it
            push!(res, 2i + 1)
            Δᵢ = 2i + 1
            for iₓ = i+Δᵢ : Δᵢ : length(oddsAlive);   oddsAlive[iₓ] = false; end
        end
    end
    for i = i_lim + 1 : length(oddsAlive) # Surviving odds also prime
        if oddsAlive[i];    push!(res, 2i + 1); end
    end

    res # returned
end
