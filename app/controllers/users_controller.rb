class UsersController < ApplicationController

	def index
		users = User.all
		sparql = SPARQL::Client.new("http://semtech.mty.itesm.mx:9002/sparql")
		queryString="SELECT * WHERE { ?s ?p ?o } OFFSET 2 LIMIT 10"
		query= sparql.query(queryString)
		# Para mandar a la vista en formato xml @data = query.to_xml
		# Para mandar a la vistsa como string @data = query.map{|q|q.o.to_s}
		@dataxml = query.to_xml
		@datastring = query.map{|q|q.o.to_s}
		@dataobject = query.map{|q|q.o}
		
		
		#:respond_to do |format|
		#	format.html # index.html.erb
		#	format.json { render json: users }
		

	end	
end
