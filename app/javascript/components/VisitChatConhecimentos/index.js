import { Card } from 'antd';
import React from 'react';
import { Cell, Pie, PieChart, Legend,Tooltip } from 'recharts';

const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042'];
const RADIAN = Math.PI / 180;   

const renderCustomizedLabel = ({ cx, cy, midAngle, innerRadius, outerRadius, percent, index }) => {
  const radius = innerRadius + (outerRadius - innerRadius) * 0.5;
 const x  = cx + radius * Math.cos(-midAngle * RADIAN);
 const y = cy  + radius * Math.sin(-midAngle * RADIAN);

 return (
   <text x={x} y={y} fill="white" textAnchor={x > cx ? 'start' : 'end'} 	dominantBaseline="central">
     {`${(percent * 100).toFixed(0)}%`}
   </text>
 );
};


export default function VisitChatConhecimentos(props) {
  const analise_data = [
    {
      name: 'HTML', value: 70,
    },
    {
      name: 'CSS', value: 16,
    },
    {
      name: 'Ruby', value: 11,
    },
    {
      name: 'Outros', value: 15,
    }
  ];
  
  return (
    <Card title="Conhecimentos" bordered={false}>
      <PieChart width={400} height={400}>
        <Pie data={analise_data} dataKey="value" fill="#8884d8" labelLine={false} label={renderCustomizedLabel}>
          {
          	analise_data.map((entry, index) => <Cell key={entry.name} fill={COLORS[index % COLORS.length]}/>)
          }
        </Pie>
        <Legend />
        <Tooltip />
      </PieChart>
    </Card>
  );
}
