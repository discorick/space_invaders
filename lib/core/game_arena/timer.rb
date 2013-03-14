class Timer

  def initialize 
    @first_run = true
  end

  def run_every time, &code
    @timer = Array 0..time if @first_run
    @first_run = false
    if @timer.length == 0
      @first_run = true
      yield code 
    end
    @timer.pop unless @timer.length == 0
  end

end
