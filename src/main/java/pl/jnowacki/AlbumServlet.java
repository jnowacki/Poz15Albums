package pl.jnowacki;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/albumServlet")
public class AlbumServlet extends HttpServlet {

    private final String ALBUMS_SESSION_NAME = "albums";
    private final String ALBUM_PAGE_PATH = "/albums.jsp";

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getSession().getAttribute(ALBUMS_SESSION_NAME) == null) {
            req.getSession().setAttribute(ALBUMS_SESSION_NAME, new ArrayList<Album>());
        }

        getServletContext().getRequestDispatcher(ALBUM_PAGE_PATH).forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String title = req.getParameter("title");
        String artist = req.getParameter("artist");
        String genre = req.getParameter("genre");
        int year = Integer.parseInt(req.getParameter("year"));

        Album album = new Album(title, artist, genre, year);

        if (album.isValid()) {
            List<Album> albums = (List) req.getSession().getAttribute(ALBUMS_SESSION_NAME);
            albums.add(album);
        }

        req.setAttribute("invalid", !album.isValid());

        getServletContext().getRequestDispatcher(ALBUM_PAGE_PATH).forward(req, resp);
    }
}
