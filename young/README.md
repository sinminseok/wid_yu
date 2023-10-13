Row(
children: days.asMap().entries.map((entry) {
final index = entry.key;
final day = entry.value;
return Text(
day,
style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold),
);
}).toList(),
),