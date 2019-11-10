import {Card} from 'antd';
import React from 'react';
import {Cell, Pie, PieChart, Legend, Tooltip} from 'recharts';

const COLORS = ['#27ae60', '#DAF7A6', '#FFC300', '#FF5733', '#C70039', '#900C3F'];
const RADIAN = Math.PI / 180;

const renderCustomizedLabel = ({cx, cy, midAngle, innerRadius, outerRadius, percent, index}) => {
    const radius = innerRadius + (outerRadius - innerRadius) * 0.5;
    const x = cx + radius * Math.cos(-midAngle * RADIAN);
    const y = cy + radius * Math.sin(-midAngle * RADIAN);

    return (
        <text x={x} y={y} fill="white" textAnchor={x > cx ? 'start' : 'end'} dominantBaseline="central">
            {`${(percent * 100).toFixed(0)}%`}
        </text>
    );
};


export default function VisitChatConhecimentos(props) {
    console.log(props)
    return (
        <Card title="Conhecimento" bordered={false}>
            <PieChart width={400} height={400}>
                <Pie data={props.data} dataKey="value" fill="#8884d8" labelLine={false} label={renderCustomizedLabel}>
                    {
                        props.data.map((entry, index) => <Cell key={entry.name}
                                                               fill={COLORS[index % COLORS.length]}/>)
                    }
                </Pie>
                <Legend/>
                <Tooltip/>
            </PieChart>
        </Card>
    );
}
