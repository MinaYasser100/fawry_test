import 'package:fawry_test/feature/cubit/fawry_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FawryCubit()..initSDKCallback(),
      child: BlocBuilder<FawryCubit, FawryState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Fawry Payment'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<FawryCubit>(context).startPayment();
                    },
                    child: const Text('Buy Books'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<FawryCubit>(context).openCardsManager();
                    },
                    child: const Text('Open Manager'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
