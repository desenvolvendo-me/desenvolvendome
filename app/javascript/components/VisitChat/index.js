import React from 'react';
import {
    Radar, RadarChart, PolarGrid, PolarAngleAxis, PolarRadiusAxis,
} from 'recharts';

export default function VisitChat(props) {
    const data = props.analysis.map(item => ({
        label: item.evaluation_type,
        level: item.level,
        fullMark: 8
    }));
    return (
        <RadarChart cx={300} cy={250} outerRadius={150} width={500} height={500} data={data}>
            <PolarGrid/>
            <PolarAngleAxis dataKey="label"/>
            <PolarRadiusAxis/>
            <Radar name="Avaliações" dataKey="level" stroke="#8884d8" fill="#8884d8" fillOpacity={0.6}/>
        </RadarChart>
    );
}
