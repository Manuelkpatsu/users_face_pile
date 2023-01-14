import 'package:face_pile_app/models/user.dart';
import 'package:flutter/material.dart';

import 'widgets/face_pile.dart';

class FacePileDemoScreen extends StatefulWidget {
  const FacePileDemoScreen({Key? key}) : super(key: key);

  @override
  State<FacePileDemoScreen> createState() => _FacePileDemoScreenState();
}

class _FacePileDemoScreenState extends State<FacePileDemoScreen> {
  final List<User> _users = [
    User(
      id: '1',
      name: 'Manuel Akpatsu',
      avatarUrl: 'https://randomuser.me/api/portraits/men/51.jpg',
      createdAt: DateTime.parse('2021-12-11'),
    ),
    User(
      id: '2',
      name: 'Gabby Okyere-Darko',
      avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
      createdAt: DateTime.parse('2023-01-05'),
    ),
    User(
      id: '3',
      name: 'Yvonne Forkuo',
      avatarUrl: 'https://randomuser.me/api/portraits/women/90.jpg',
      createdAt: DateTime.parse('2022-03-11'),
    ),
    User(
      id: '4',
      name: 'Fumilayo Oluwanike Awaitey',
      createdAt: DateTime.parse('2022-11-15'),
    ),
    User(
      id: '5',
      name: 'Kily Paddy Attamah',
      createdAt: DateTime.parse('2022-12-11'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _users.isNotEmpty
            ? Center(
                child: Row(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 150),
                      child: FacePile(
                        users: _users,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _users.last.name.isNotEmpty
                            ? _users.last.name.trim().split(' ').take(2).join(' ')
                            : '',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
