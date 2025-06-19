import 'package:etrack/components/back_button.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PoliciesScreen extends StatelessWidget {
  const PoliciesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(20.sm),
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButtonCustom(isDark: false),
                  Text(
                    'سياسة الخصوصية',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'تحكم سياسة الخصوصية الأسلوب الذي تقوم به “منصة تأكيد” بجمع، معلومات الاستخدام، والحفاظ والتصريح بالمعلومات التي تم جمعها من قبل مستخدمين خدمة “منصة تأكيد”، وتطبق سياسة الخصوصية هذه في الخدمة وكافة المنتجات والخدمات المقدمة من “منصة تأكيد”.',
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'معلومات الهوية الشخصية :',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  height: 2,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                ' تعمل “منصة تأكيد” بجمع معلومات عن الهوية الشخصية للمستخدمين بطرق مختلفة، وتشمل ولا تقتصر فقط على: أوقات زيارة المستخدم للخدمة، التسجيل في خدمة “منصة تأكيد”، تعبئة الطلب، نموذج الاستبيان، وغير ذلك من أنشطة، الخدمات، والميزات أو المصادر التي قد نوفرها على خدماتنا (منصة تأكيد) . \n  كما أنه قد يُطلب من المستخدمين توضيح الاسم بشكل كامل، عنوان البريد الإلكتروني، رقم الهاتف، وبيانات الايبان البنكي او بطاقة الصرف الآلي المستخدمة عند المستخدم مثل (بطاقة مدى ).',
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'معلومات لا تتعلق بالهوية الشخصية:',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  height: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                ' تقوم “منصة تأكيد” بجمع بعض المعلومات عن المتفاعلىن أينما كانوا مع خدمة تأكيد، وهذه المعلومات لا تتعلق بالهوية الشخصية إنما قد تتضمن معلومات تقنية عن أساليب اتصال المستخدم بالخدمة، مثل الشركة المستخدمة لتقديم خدمة الإنترنت (stc  ) مثلا  وغيرها من المعلومات المشابهة.',
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'كيف نقوم باستخدام المعلومات التي تم جمعها :',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  height: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                ' تقوم “منصة تأكيد” بجمع واستخدام المعلومات الشخصية للمستخدمين في الأغراض التالية: \n  تحسين جودة خدمة العملاء: \n  تساعدنا المعلومات الخاصة بك على سهولة الاستجابة لطلباتك الموجهة لخدمة العملاء واحتياجاتك للدعم بشكل أكثر فاعلىة.',
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                ' لتحسين الخدمة:',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  height: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'تسعى منصة تأكيد لتحسين الخدمات المقدمة باستمرار من خلال الخدمة وفقاً للمعلومات والملاحظات التي نتلقاها منك من أجل فهم أفضل لمصالح واحتياجات مستخدمي  خدماتنا  في منصة تأكيد.',
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                ' إرسال رسائل إلكترونية بشكل دوري :',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  height: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'عنوان البريد الإلكتروني الذي يسجله المستخدمون للتعامل مع طلبهم، سوف يستخدم فقط في إرسال معلومات وتحديثات لهم تتعلق بطلبهم. وقد يُستخدم أيضاً في الرد على استفساراتكم، أو غيرها من الطلبات والأسئلة الى ترد على الموقع . \n في حال قرر المستخدم الانضمام إلى قائمة مراسلاتنا، فإنه سوف يتلقى رسائل على بريده الإلكتروني قد تتضمن أخبار “منصة تأكيد” ، آخر التحديثات، ومعلومات تتعلق بالخدمة. وإذا أراد المستخدم في أي وقت إلغاء خاصية تلقي أي رسائل مستقبلية، فإننا نقدم له توجيهات مفصلة حول إلغاء التسجيل في نهاية كل رسالة على بريده الإلكتروني، او يمكن للمستخدم التواصل معنا من خلال الخدمة أو موقعنا الإلكتروني(support@takid.sa)  ',
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'كيف نقوم بحماية معلوماتك :',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  height: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                ' نحن نتبع الإجراءات السليمة ومعايير الأمان في جمع وحفظ والتعامل مع البيانات، وذلك لحماية تلك البيانات ضد التعامل الغير مصرح به، أو التعديل، أو الإفصاح أو إتلاف بياناتك الشخصية، (اسم المستخدم، وكلمة المرور)، ومعلومات تخص تعاملاتك والبيانات المخزنة على منصة تأكيد . يتم تبادل البيانات الحساسة والخاصة بين “منصة تأكيد” ومستخدميها من خلال قنوات اتصال مؤمنة ويتم تشفيرها وحمايتها من خلال طرق وأساليب رقمية معتمدة.',
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'المواقع الخاصة بالطرف الثالث :',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  height: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                ' قد يجد المستخدمون إعلانات أو غيرها من المحتويات على خدمات منصة تأكيد تحمل روابط لمواقع وخدمات شركائنا، أو الموردين، أو المعلنين، أو الراعين، أو مانحي التراخيص، أو غيرهم من الكيانات التي تمثل الطرف الثالث. وينبغي العلم بأننا لا نتحكم في المحتوى أو الروابط التي تظهر على تلك المواقع ولسنا مسئولين عن الممارسات التي تقوم بها المواقع الخارجية (هل نقول المرتبطة بموقعنا او المحملة علة موقع منصة تأكيد ). بالإضافة إلى ذلك، فإن تلك المواقع أو الخدمات وتشمل المحتوى والروابط قد تتغير باستمرار. وهذه المواقع والخدمات يكون لديها سياسة الخصوصية وسياسات خدمة العملاء الخاصة بها. كما أن التصفح والتفاعل على أي موقع آخر، بما في ذلك المواقع التي تحمل رابط لخدمتنا، تخضع للشروط والسياسات الخاصة بتلك المواقع.',
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'التغيرات التي تطرأ على سياسة الخصوصية :',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  height: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                ' تمتلك “منصة تأكيد” حرية التصرف في تحديث سياسة الخصوصية هذه في أي وقت. وعندما نقوم بذلك يجب على المستخدم مراجعة تاريخ التحديث أسفل هذه الصفحة. لذا نحث المستخدمين على مراجعة سياسة الخصوصية بشكل متكرر ودوري للاطلاع على أي تغيرات  \n بحيث يكون المستخدم  على علم بما نقوم به في منصة تأكيد  لحماية البيانات الشخصية التي نقوم بجمعها. يقر ويوافق المستخدم على مسؤوليته في مراجعة سياسة الخصوصية هذه بشكل دوري وإدراكه للتعديلات.',
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'الموافقة على سياسة الخصوصية :',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  height: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                ' استخدامك لهذه  الخدمة، يفيد بموافقتك واقرارك على سياسة الخصوصية المتبعة لدينا بمنصة تأكيد والضوابط والشروط التي تحكم استخدام هذه الخدمة لدى منصة تأكيد . ',
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'للتواصل معنا :',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  height: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                'في حال لديك أي استفسارات أخرى  عن الخدمة بمنصة تأكيد يرجى التواصل معنا من خلال نموذج الاتصال بالموقع على البريد الالكتروني (support@takid.com) .',
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
