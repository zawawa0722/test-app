class SeachesController < ApplicationController
  def search
    @content = params['search']['content']
    @how = params['search']['how']
    @model = params['search']['model']
    @datas = search_for(@how, @model, @content)
  end

private

  def match(model, content)
    if model == 'user'
      User.where(name: content)
    elsif model == 'muscle'
      Muscle.where(work_tag: content)
    end
  end

  def forward(model, content)
    if model == 'user'
      User.where('name LIKE ?', "#{content}%")
    elsif model == 'muscle'
      Muscle.where('work_tag LIKE ?', "#{content}%")
    end
  end

  def backward(model, content)
    if model == 'user'
      User.where('name LIKE ?', "%#{content}")
    elsif model == 'muscle'
      Muscle.where('work_tag LIKE ?', "%#{content}")
    end
  end

  def partical(model, content)
    if model == 'user'
      User.where('name LIKE ?', "%#{content}%")
    elsif model == 'muscle'
      Muscle.where('work_tag LIKE ?', "%#{content}%")
    end
  end

  def search_for(how, model, content)
    case how
    when 'match'
      match(model, content)
    when 'forward'
      forward(model, content)
    when 'backward'
      backward(model, content)
    when 'partical'
      partical(model, content)
    end
  end
end
end
