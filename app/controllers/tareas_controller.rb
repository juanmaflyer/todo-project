class TareasController < ApplicationController
  class NoAutorizado < RuntimeError
  end
  
  before_filter :usuario_autorizado?, :only => [:new, :edit]
  rescue_from NoAutorizado, :with => :usuario_invalido
  
  # GET /tareas/new
  # GET /tareas/new.xml
  def new
	@lista_de_tarea = ListaDeTarea.find(params[:lista_de_tarea_id])
    @tarea = @lista_de_tarea.tareas.build
  end

  # POST /tareas
  # POST /tareas.xml
  def create
	@lista_de_tarea = ListaDeTarea.find(params[:lista_de_tarea_id])
    @tarea = @lista_de_tarea.tareas.build(params[:tarea])
    if @tarea.save
      flash[:notice] = "Nueva tarea creada!"
      redirect_to lista_de_tarea_url(@lista_de_tarea)
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
	@lista_de_tarea = ListaDeTarea.find(params[:lista_de_tarea_id])
    @tarea = @lista_de_tarea.tareas.find(params[:id])

    
      if @tarea.update_attributes(params[:tarea])
        flash[:notice] = 'La tarea fue modificada satisfacotiramente'
        redirect_to lista_de_tarea_url(@lista_de_tarea)
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
  
  private
  def usuario_autorizado?
  
	#--- Esto funciona y se puede hacer, pero hay un método que devuelve los ids asociados al objecto padre
	#--- el método es current_user.lista_de_tarea_ids (el objecto asociado EN SINGULAR!)
	# @lista_de_tareas = current_user.lista_de_tareas
	# @ids = []
	# @lista_de_tareas.each do |lt|
		# @ids << lt.id
	# end
	
	@ids = current_user.lista_de_tarea_ids
	unless @ids.include?(params[:lista_de_tarea_id].to_i)
		raise NoAutorizado
	end
  end
  
  def usuario_invalido
	flash[:error] = "Intentaste agregar o editar una tarea en una lista que no te pertenece"
	redirect_to lista_de_tareas_path
	
  end
  
end
