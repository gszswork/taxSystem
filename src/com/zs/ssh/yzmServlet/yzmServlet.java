package com.zs.ssh.yzmServlet;
 
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
 
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
@WebServlet("/yzmServlet")
public class yzmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    public yzmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 首先设置浏览器不缓存
	    response.setHeader("cache-control", "no-cache");
 
	    response.setHeader("Expire", "-1"); // >0为缓存
 
	    response.setHeader("pragma", "no-cache");
 
	    // 存储正确的验证码
 
	    String vali_code = "";
 
	    String Vali_str = "abcdefghijklmnopqrstuvwsyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";
 
	    Color[] colors =
 
	        { Color.WHITE, Color.RED, Color.BLUE };
 
	    // 1.创建图像
 
	    int width = 90, height = 40;
 
	    int x_offset = 4, y_offset = 29;
 
	    BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
 
	    // 2.创建画布
 
	    Graphics2D g = img.createGraphics();
 
	    // 3.为画布添加背景颜色
 
	    g.setColor(Color.LIGHT_GRAY);
 
	    g.fillRect(0, 0, width, height);//fillRect是包括矩形框内部
 
	    // 4.为画布添加边框
 
	    g.setColor(Color.BLACK);
 
	    g.drawRect(0, 0, width - 1, height - 1);//drawRect是绘制矩形边框
 
	    // 5.绘制干扰线
 
	    for (int i = 0; i < 10; i++)
	    {
	        g.setColor(new Color(randNum(0, 255), randNum(0, 255), randNum(0, 255)));
 
	        g.drawLine(randNum(0, width), randNum(0, height), randNum(0, width), randNum(0, height));
 
	    }
	    g.setFont(new Font("黑体", Font.BOLD, 20));
	    for (int i = 0; i < 4; i++)
	    {
	        int r = randNum(-180, 180);
 
	        String code = Vali_str.charAt(randNum(0, Vali_str.length() - 1)) + "";
 
	        g.rotate(r / 180 * Math.PI);
 
	        g.setColor(colors[randNum(0, colors.length)]);
 
	        g.drawString(code, x_offset + i * 20, y_offset);
 
	        g.rotate(-r / 180 * Math.PI);
 
	        vali_code += code;
 
	    }
 
	    //将验证码的内容存储在HttpSession中
 
	    HttpSession session = request.getSession();
	    
	    session.setAttribute("Valicode", vali_code);
 
	    // 通过response的输出流打给浏览器
 
	    ImageIO.write(img, "jpg", response.getOutputStream());
	}
	private Random random = new Random();
 
	//随机生成begin和end之间的一个int值
 
	private int randNum(int begin, int end)
 
	{
 
	    return random.nextInt(end - begin) + begin;
 
	}
}