package movelist;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "MovieListServlet", value = "/movielist")
public class MovieListServlet extends HttpServlet {

    private static final List<Movie> MOVIES = Arrays.asList(
            new Movie("Ojciec chrzestny", "dramat", 1972, 120000000),
            new Movie("Pluton", "wojenny", 1986, 50000000),
            new Movie("Nagi instynkt", "thriller", 1992, 100000000)
    );

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute( "movies", MOVIES);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("movieList.jsp");
        requestDispatcher.forward(request, response);
    }
}
