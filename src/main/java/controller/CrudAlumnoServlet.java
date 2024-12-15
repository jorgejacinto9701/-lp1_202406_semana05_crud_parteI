package controller;

import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;

import entity.Alumno;
import entity.Respuesta;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.AlumnoModel;

@WebServlet("/crudAlumno")
public class CrudAlumnoServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String metodo = req.getParameter("metodo");
		switch (metodo) {
		case "paramLista":
			lista(req, resp);
			break;
		case "paramInserta":
			inserta(req, resp);
			break;
		case "paramActualiza":
			actualiza(req, resp);
			break;
		case "paramLogico":
			eliminacionLogica(req, resp);
			break;
		case "paramFisico":
			eliminacionFisica(req, resp);
			break;
		}
	}
	
	protected void lista(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String filtro = req.getParameter("filtro");
		AlumnoModel model = new AlumnoModel();
		List<Alumno> lista = model.listaPorNombreLike(filtro);
		
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(json);
	}
	
	protected void inserta(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {}
	protected void actualiza(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {}
	
	protected void eliminacionFisica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		int intId = Integer.parseInt(id);
		
		AlumnoModel model = new AlumnoModel();
		int salida = model.eliminarFisico(intId);
		
		Respuesta objRespuesta = new Respuesta();
		if (salida > 0) {
			List<Alumno> lista = model.listaPorNombreLike("");
			objRespuesta.setMensaje("Actualización existosa");
			objRespuesta.setDatos(lista);
		}

		// convertir el objeto respuesta a JSON
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);

		// respuesta al browser
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(json);
		
	}
	
	protected void eliminacionLogica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String estado = req.getParameter("estado");
		
		int intId = Integer.parseInt(id);
		int idEstado = Integer.parseInt(estado);
		int idNewEstado = idEstado == 0 ? 1 : 0;
		
		AlumnoModel model = new AlumnoModel();
		int salida = model.eliminarLogico(intId, idNewEstado);
		
		Respuesta objRespuesta = new Respuesta();
		if (salida > 0) {
			List<Alumno> lista = model.listaPorNombreLike("");
			objRespuesta.setMensaje("Eliminación existosa");
			objRespuesta.setDatos(lista);
		}

		// convertir el objeto respuesta a JSON
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);

		// respuesta al browser
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(json);
	}
	
	
}
