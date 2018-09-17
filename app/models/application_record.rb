class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Category.first.all_posts_of_year_with_category(2018)
  def all_posts_of_year_with_category(year)
    posts.where(year: year)
  end

  # Category.first.all_posts_of_year_with_category(2018, 8)
  def all_posts_of_month_with_category(year, month)
    posts.where(year: year).where(month: month)
  end

  # Category.first.all_posts_of_year_with_category(2018, 8, 5)
  def all_posts_of_day_with_category(year, month, day)
    posts.where(year: year).where(month: month).where(day: day)
  end

end
