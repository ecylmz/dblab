# encoding: utf-8
class FacultyController < ApplicationController
  def new
    faculty = Faculty.new({
      name:      params[:name],
    })
    if faculty.save
      flash[:notice] = "Kaydınız Alınmıştır. Teşekkür Ederiz"
    else
      flash[:error] = "Kaydınız Alınamadı"
    end
  end
end
