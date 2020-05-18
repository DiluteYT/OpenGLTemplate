#include <glew/glew.h>
#include <glfw/glfw3.h>

int main(void)
{
    GLFWwindow* window;

    /* Initialize glfw and check for errors */
    if (!glfwInit())
        return -1;

    /* Create a windowed mode window and its OpenGL context */
    window = glfwCreateWindow(640, 480, "Hello World", NULL, NULL);
    if (!window)
    {
        glfwTerminate();
        return -1;
    }

    /* Make the window's context current */
    glfwMakeContextCurrent(window);

    /* Initialize glew and check for errors */
    if (glewInit() != GLEW_OK)
        return -1;

    /* Loop until the user closes the window */
    glClearColor(0.7f, 0.2f, 0.2f, 1.0f);
    while (!glfwWindowShouldClose(window))
    {
        /* Render here */
        glClear(GL_COLOR_BUFFER_BIT);

        /* Swap front and back buffers */
        glfwSwapBuffers(window);

        /* Poll for and process events */
        glfwPollEvents();
    }

    glfwTerminate();
    return 0;
}