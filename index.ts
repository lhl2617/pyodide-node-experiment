(async function () {
    const pyodide_pkg = await import("pyodide/pyodide.js")
    const pyodide = await pyodide_pkg.loadPyodide({
        indexURL: "./artifacts/pyodide",
    })

    const res = await pyodide.runPythonAsync("print(1+1)")
    console.log(res)
}())
