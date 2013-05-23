# encoding: utf-8
class DepartmentController < ApplicationController
  def new
    department = Department.new({
      name:      params[:name],
      faculty_id: params[:faculty_id],
    })
    if department.save
      flash[:notice] = "Kaydınız Alınmıştır. Teşekkür Ederiz"
    else
      flash[:error] = "Kaydınız Alınamadı"
    end
  end
end
