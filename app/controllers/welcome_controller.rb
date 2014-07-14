class WelcomeController < ApplicationController
	respond_to :html, :xml, :json
	def index
		sparql = SPARQL::Client.new("http://semtech.mty.itesm.mx:3030/VIVO/sparql")
		queryString="PREFIX vivo: <http://vivoweb.org/ontology/core#>
		SELECT ?prof_key ?kw
		WHERE
		{
			?prof_key vivo:freetextKeyword ?kw . 
			?prof_key vivo:primaryEmail ?email
			filter (?email = '"+ current_user.email + "')
			} LIMIT 20"
			query= sparql.query(queryString)
		#@datastring = queryString	
		
		
		# Para mandar a la vista en formato xml @data = query.to_xml
		# Para mandar a la vistsa como string @data = query.map{|q|q.o.to_s}
		@datastringkw = query.map{|q|q.kw.to_s}
		#@dataxml = query.to_xml
		@dataobject = query.to_s
		@datastring = query.map{|q|q.kw.as_json}
		
		#@dataobject = query.map{|q|q.o}
		
	end	
end
