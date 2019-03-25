def show(wish = nil, &block)
  timenow = Time.now
  if block_given?
    blockmovie = filter(wish, &block).sample
    puts "Now showing: #{blockmovie.name} (#{timenow.strftime('%H:%M')}\
     -- #{(timenow + (60 * blockmovie.time)).strftime('%H:%M')})"
  else
    raise ArgumentError, 'This field doesnt exist' if filter(wish).empty?

    movie = filter(wish).sample
    paying_process(movie)
    puts "Now showing: #{movie.name} (#{timenow.strftime('%H:%M')}\
     -- #{(timenow + (60 * movie.time)).strftime('%H:%M')})"
  end
    end
