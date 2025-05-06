 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Assign Medicine to patients</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f2f2f2;
            padding: 40px;
            display: flex;
            justify-content: center;
        }

        .prescription-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 900px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
            font-size: 24px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
        }

        thead {
            background-color: #4CAF50;
            color: white;
        }

        th, td {
            padding: 14px 16px;
            text-align: left;
            border-bottom: 1px solid #eaeaea;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .no-data {
            text-align: center;
            padding: 20px;
            font-style: italic;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="prescription-container">
        <h2>Assign Medicine To Patients</h2>

        <!-- Static example table content -->
        <table>
            <thead>
                <tr>
                    <th>Patient ID</th>
                    <th>Name</th>
                    <th>Prescription</th>
                    <th>Type</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>2001</td>
                    <td>Jane Smith</td>
                    <td>Ibuprofen</td>
                    <td>Painkiller</td>
                </tr>
                <tr>
                    <td>2002</td>
                    <td>Michael Johnson</td>
                    <td>Metformin</td>
                    <td>Diabetes</td>
                </tr>
            </tbody>
        </table>

        <!-- Example if no data -->
        <!--
        <div class="no-data">No prescriptions available.</div>
        -->
    </div>
</body>
</html>