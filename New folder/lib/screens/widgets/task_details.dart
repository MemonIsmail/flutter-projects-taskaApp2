import 'package:flutter/material.dart';

import '../screens_colors.dart';

class TaskDetails extends StatelessWidget {
  final int? id;
  final String title;
  final String dueDate;
  final String priority;
  final String status;
  final String assignee;
  final String description;
  final int? onTap;
  const TaskDetails(
      {
        super.key,
        this.id,
        required this.title,
        required this.dueDate,
        required this.priority,
        required this.status,
        required this.assignee,
        required this.description,
        this.onTap,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 25,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: (status == 'In Progress') ? kGreenColor : (status == 'Pending') ? kYellowColor : kPrimaryColor,
                            width: 1.5,
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: (status == 'In Progress') ? kGreenColor : (status == 'Pending') ? kYellowColor : kPrimaryColor,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                                Icons.flag,
                                color: (priority == 'High') ? kRedColor : (priority == 'Normal') ? kGreenColor : kYellowColor
                            ),
                            Text(
                              priority,
                              style: TextStyle(
                                color: (priority == 'High') ? kRedColor : (priority == 'Normal') ? kGreenColor : kYellowColor,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: kGreyColor,
                              size: 20,
                            ),
                            SizedBox(width: 5,),
                            Text(
                              assignee,
                              style: TextStyle(
                                color: kGreyColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: kGreyColor,
                              size: 20,
                            ),
                            SizedBox(width: 5,),
                            Text(
                              dueDate,
                              style: TextStyle(
                                  color: kGreyColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}