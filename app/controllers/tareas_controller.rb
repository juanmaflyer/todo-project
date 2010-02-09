class TareasController < ApplicationController

  # GET /tareas/new
  # GET /tareas/new.xml
  def new
	@lista_de_tarea = ListaDeTarea.find(params[:lista_de_tarea_id])
    @tarea = @lista_de_tarea.tareas.new
  end

  # POST /tareas
  # POST /tareas.xml
  def create
	@list = ListaDeTarea.find(params[:lista_de_tarea_id])
    @task = @list.tareas.new(params[:tarea])
    if @task.save
      flash[:notice] = "New task created!"
      redirect_to lista_de_tarea_url(@list)
    else
      render :action => :new
    end
  end
  
  # GET /tareas/1/edit
  def edit
	@lista_de_tarea = ListaDeTarea.find(params[:lista_de_tarea_id])
    @tarea = @lista_de_tarea.tareas.find(params[:id])
  end

  

  # PUT /tareas/1
  # PUT /tareas/1.xml
  def update
	@lt = ListaDeTarea.find(params[:lista_de_tarea_id])
    @tarea = @lt.tareas.find(params[:id])

    
      if @tarea.update_attributes(params[:tarea])
        flash[:notice] = 'La tarea fue actualizada satisfacotiramente'
        redirect_to lista_de_tarea_url(@lt)
      else
        render :action => "edit" 
      end
  end

  # DELETE /tareas/1
  # DELETE /tareas/1.xml
  def destroy
	@lt = ListaDeTarea.find(params[:lista_de_tarea_id])
    @tarea = Tarea.find(params[:id])
    @tarea.destroy

    respond_to do |format|
      format.html { redirect_to lista_de_tarea_url(@lt) }
      format.xml  { head :ok }
    end
  end
end
