module ApplicationHelper
    def check(num)
    if num < 10
      0.to_s + num.to_s
    else
      num
    end
  end
end
