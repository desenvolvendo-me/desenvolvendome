import { Card } from 'antd';
import React from 'react';
import { PolarAngleAxis, PolarGrid, PolarRadiusAxis, Radar, RadarChart, Tooltip } from 'recharts';

export default function VisitChatAnalise(props) {
  const data = props.data.map(item => ({
    label: item.evaluation_type,
    level: item.level,
    fullMark: 8
  }));
  return (
    <Card title="Análise" bordered={false}>
      <RadarChart outerRadius={120} width={500} height={300} data={data}>
        <PolarGrid />
        <PolarAngleAxis dataKey="label" />
        <PolarRadiusAxis angle={45} domain={[0, 5]} />
        <Radar name="Nível" dataKey="level" stroke="#8884d8" fill="#8884d8" fillOpacity={0.6} />
        <Tooltip />
      </RadarChart>
    </Card>
  );
}
